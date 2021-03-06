# DataFingerprint 
## Data Warehouse Consistency during Live Migrations
Repository for the Project developed in the Data Engineering Fellowship at Insight Data Science

## During the live and continuous migration from a server-based Data Warehouse to a server-less Data Lake the business must be confident that both repositories are consistent and accurate.

### Problem Statement

Many businesses have developed data warehouses on RDBM's such as Oracle, SQL Server and others that are data-center or essentially server-based. These legacy databases have always had problems with scalability - as the business and data grows, the warehouse can eventually slow down in the ETL phases as well as the end-user analytic side. The usual solution of provisioning more CPUs and higher performing disk arrays is very costly not only in terms of money, but in engineering and project management time.

The distributed computing paradigm is attractive in many ways. Moving the data warehouse to open source technologies can result in a tremendous cost saving - millions of dollars a year can be spent on Oracle or SQL Server licensing alone. The pay-for-only-what-you-use model of AWS and Google is attractive to business owners as the relationship of costs to results is very deterministic.

However, migrating a data warehouse to the cloud is not trivial. The problems of moving the data to a new platform are in the technical and project management areas as expected. Another aspect is re-deploying the analytic infrastructure such as reports, dashboards, and etc. to utilize a new back-end on very different technologies. The engineering challenge of moving the data is separate from moving the analytic infrastructure. Additionally, development on the new reporting infrastructure can be on a different timeline than the data migration.

To facilitate a success migration, the analytic end-users must have confidence that the new solution gives the same answers as the previous one. As the analytic developers are working in their new environment, a tool that can reliably indicate that the underlying data is consistent can help developers ensure that descrepancies are due to development bugs rather than data consistency. 

### Architecture

The legacy database will be an MySQL RDBMS in the cloud to represent a typical server-based database. The new data store will be a data lake in Amazon S3. Amazon Redshift Spectrum will be used to query the S3 data lake. However, the advantage of the data lake is that it is independent of Redshift Spectrum and could be analyzed by Presto for example. New data will be managed to both databases by Airflow. Flask will be used as the front-end for the fingerprint checker. Airflow handles the migration and fingerprinting processes separately and asynchronously. 

### Data Source

A historic baseball warehouse will be used and extended programmatically to achieve data warehouse sizes. Data generated by the OOTP baseball game will function as the initial data warehouse with new data generated from that warehouse to extend partitioning. 

### Installation

There are 5 main functional parts to DataFingerprint. Their installation procedures are below.

#### MySQL installation

The initial seed for the data warehouse is a set of sql files created by the computer game Out of the Park Baseball. These files contain statistical data for many seasons of simulated baseball for many leagues, teams, and players. The warehouse can be then be expanded to any size by simulating a typical situation where a daily run of simulations is created by duplicating from the seed. These files are in sql/mysql/seed/. They have create table statements before the inserts.



### Engineering Challenge

Directly comparing the data between two >500GB data warehouses is a computational challenge. Rather than comparing row-by-row equivalencies, a solution can be devised that does not continuously and adversely affect the load on the data warehouses but must give accurate results on the consistency between the two. Md5 checksums done on the concatenated representation of each row and then converted into numeric representations that can be summed across the whole data set is the solution devised by DataFingerprint. The final unsigned long int is the fingerprint that uniquely characterizes the data set.

### Business Value

During the migration, tremendous time can be saved in the analytic development process if bugs can be reliably ruled out as due to data inconsistency. Consequently, the fingerprint also acts as a check on the migration process itself.

### MVP

The minimum viable product will the two data stores, a streaming generator and a set of Presto statements for data consistency.

### Stretch Goals

A dashboard to highlight consistency and inconsistency. Alerts for inconsistent data. Drill down capability to highlight where the inconsistencies lie.
