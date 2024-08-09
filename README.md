# Movie Database Setup

This README provides instructions for setting up the movie database using the `init.sql` file and running the Appsmith application.

## Prerequisites

- PostgreSQL installed and running on your system
- Access to the TMDB movie dataset CSV file
- Docker and Docker Compose installed on your system

## Setup Instructions

1. Run the following command to create the `movies` table:

   ```bash
   psql -f ./lib/init.sql
   ```

   This command will:
   - Drop the existing `movies` table if it exists
   - Create a new `movies` table with the specified schema

## Running the Application

1. Start the Appsmith application using Docker Compose:

   ```bash
   docker-compose up -d
   ```

   This command will start the Appsmith application in detached mode.

2. Access the application:

   Once the containers are up and running, you can access your Appsmith application by opening a web browser and navigating to:

   ```
   http://localhost
   ```

3. Import the CSV file:
  - Navigate to the Appsmith application
   - Click the "Import CSV" button
   - Select the CSV file from your local system

## Application Description

This Appsmith application provides a user-friendly interface for managing and interacting with the movie database. One of its key features is the CSV upload functionality:

### CSV Upload Feature for Bulk Create and Update

The application includes a CSV upload feature that allows users to easily import and update movie data in bulk. This feature can be used to create new movie entries or update existing ones in the database. Here's how it works:

1. File Selection: The app uses a FilePicker widget to allow users to select a CSV file from their local system.

2. Data Transformation: Once a file is selected, the application reads and transforms the contents of the CSV. A crucial part of this transformation is escaping single quotes in the data. This step is necessary to ensure that the data can be successfully ingested by PostgreSQL without causing syntax errors in SQL statements.

3. Database Ingestion: After the transformation, the data is prepared for insertion or update in the PostgreSQL database. The application checks each row against existing records:
   - If a movie with the same ID already exists in the database, that row will be updated with the new information.
   - If no matching ID is found, a new row will be created for that movie.

4. Success Notification: Upon successful upload and processing of the data, the application displays an alert to notify the user that the bulk create/update operation has been completed successfully.

5. Reset: After the successful operation, the FilePicker widget is automatically reset, allowing the user to easily upload another file if needed.

This feature streamlines the process of managing the movie database, making it easy for users to add new movie data or update existing records in bulk. It provides a flexible way to keep the database up-to-date with large datasets. The success notification and automatic reset of the FilePicker widget enhance the user experience by providing clear feedback and preparing the interface for potential subsequent uploads.


### Other Functionalities

The application includes several additional features designed to assist admin users in managing and analyzing the movie database effectively:

1. Advanced Search Functionality:
   - Admin users can perform comprehensive searches across multiple fields including movie titles, keywords, and genres.
   - This feature enables quick location of specific movies or groups of movies, facilitating efficient database management and content curation.

2. Language Selection:
   - A dropdown menu is provided for admin users to filter movies by their original language.
   - This allows for easy auditing of language diversity in the database and can assist in content organization or localization efforts.

3. Genre Multi-select:
   - Admins can select multiple genres using a multi-select widget.
   - The genre filter uses AND-like logic, returning movies that belong to all selected genres.
   - This feature is particularly useful for identifying movies that span multiple genres, aiding in content categorization and metadata management.

These functionalities combine to create a powerful toolset for admin users to efficiently manage and analyze the movie database. Admins can quickly filter and locate specific subsets of movies, assess the diversity of content across languages and genres, and make informed decisions about content curation and database management. These tools streamline administrative tasks and provide valuable insights into the composition of the movie collection.

## Notes

- Ensure that you have the necessary permissions to read the CSV file and write to the database.
- The `init.sql` script assumes you're connected to the correct database. If not, you may need to specify the database name in the `psql` command.
- If you encounter any issues with file paths, make sure to use absolute paths or adjust your current working directory accordingly.

## Future Improvements

If given more time, I would consider implementing the following enhancements:

1. Set up SSL on Postgres for secure database connections
2. Implement parameterized queries to defend against SQL injection attacks
3. Add validations for all input fields
4. Implement file validation in the FilePicker widget to only accept CSV files
5. Validate the presence of required fields in the CSV being uploaded