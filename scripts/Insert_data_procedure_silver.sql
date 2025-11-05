/*
=====================================================================
Stored Procedure: Load Silver Layer (Source -> Silver)
=====================================================================
Script Purpose:
    This is a stored procedure to load data directly from the source
    file to the table 'silver.penguins_size'.
    It performs the following actions:
        -Truncates the table before loading data.
        -Uses a 'BULK INSERT' command to load the data from csv file 
         silver table.
    Complete with error handling and time coding.
*/

CREATE OR ALTER PROCEDURE silver.load_silver AS
BEGIN
    DECLARE @start_time DATETIME, @end_time DATETIME;
    BEGIN TRY
        PRINT '============================================';
        PRINT'Loading the Silver Layer';
        PRINT '============================================';
        SET @start_time = GETDATE();
        PRINT '>>>Truncating Table: silver.penguins_size';
        TRUNCATE TABLE silver.penguins_size;
        PRINT 'Inserting Data Into: silver.penguins_size';
        BULK INSERT silver.penguins_size
        FROM 'C:\\Temp\\penguins_size.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '\n',
            TABLOCK
        );
        SET @end_time = GETDATE();
        PRINT '>>> Load Duration: ' + CAST(DATEDIFF(second,@start_time, @end_time) AS NVARCHAR) + ' seconds'
    END TRY
    BEGIN CATCH
        PRINT '=========================================';
        PRINT 'ERROR OCCURED DURING LOADING SILVER LAYER';
        PRINT 'Error Message' + ERROR_MESSAGE();
        PRINT 'Error Message' + CAST(ERROR_NUMBER() AS NVARCHAR);
        PRINT '=========================================';
    END CATCH
END;
