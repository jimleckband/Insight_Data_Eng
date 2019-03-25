# Data Warehouse Consistency during Live Migrations
Repository for the Project developed at Insight Data Science for the Data Engineering Fellowship Project

## During the live and continuous migration from a server-based Data Warehouse to a server-less Data Lake the business must be confident that both repositories are consistent and accurate.

### Problem Statement

Many businesses have developed data warehouses on RDBM's such as Oracle, SQL Server and others that are data-center or essentially server-based. These legacy databases have always had problems with scalability - as the business and data grows, the warehouse can eventually slow down in the ETL phases as well as the end-user analytic side. The usual solution of provisioning more CPUs and higher performing disk arrays is very costly not only in terms of money, but in engineering and project management time.

The distributed computing paradigm is attractive in many ways. Moving the data warehouse to open source technologies can result in a tremendous cost saving - millions of dollars a year can be spent on Oracle or SQL Server licensing alone. The pay-for-only-what-you-use model of AWS and Google is attractive to business owners as the relationship of costs to results is very deterministic.

However, migrating a data warehouse to the cloud is not trivial. The problems of moving the data to a new platform are in technical and project management areas as expected. Another aspect is moving the analytic infrastructure such as reports, dashboards, and etc. to point to a new back-end. The engineering challenge of moving the data is separate than moving the analytic infrastructure. Additionally, development on the new reporting infrastructure can be on a different timeline than the data migration.

To facilitate a success migration, the analytic end-users must have confidence that the new solution gives the same answers as the previous one. As the analytic developers are working in their new environment, a tool that can reliably indicate that the underlying data is consistent can help developers ensure that descrepancies are due to development bugs rather than data consistency. 

### Tech Stack

The legacy database will be an MySQL RDBMS in the cloud to represent a typical server-based database. The new data store will be a data lake in Cassandra or Hive. New data will be managed to both databases by Kafka or Airflow. Presto will be used as the backend for the consistency checker. Inconsistent data at the source will be handled by turning off streaming to either data store.

![Data Flow](../master/images/Insight_Project.svg)

### Data Source

A historic baseball warehouse will be used and extended programmatically to achieve data warehouse sizes. Either baseball retrosheet data or data generated by the OOTP baseball game will function as the seed. Scripts obtained from generatedata.com will be used to extend the data and generate the new streaming data.

### Engineering Challenge

Directly comparing the data between two huge >500GB data warehouses is a computational challenge. Rather than comparing row-by-row equivalencies, a solution must be devised that does not continuously and adversely affect the load on the data warehouses but must give accurate results on the consistency between the two. Checksums on the underlying data are one possibility to explore - with levels of checksums from the whole data store, to date partitions on the whole data, and then to individual tables.

### Business Value

During the migration, tremendous time can be saved in the analytic development process if bugs can be reliably ruled out as due to data inconsistency. 

### MVP

The minimum viable product will the two data stores, a streaming generator and a set of Presto statements for data consistency.

### Stretch Goals

A dashboard to highlight consistency and inconsistency. Alerts for inconsistent data. Drill down capability to highlight where the inconsistencies lie.
