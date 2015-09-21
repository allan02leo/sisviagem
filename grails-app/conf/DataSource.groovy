dataSource {
    pooled = true
    driverClassName = "org.postgresql.Driver"
    username = "postgres"
    password = "postgres"
}

hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = true
	//dialect = "org.hibernate.dialect.PostgreSQLDialect"
    cache.region.factory_class = 'net.sf.ehcache.hibernate.EhCacheRegionFactory'
    //singleSession = true 
	//flush.mode = 'manual' // OSIV session flush mode outside of transactional context

}
// environment specific settings
environments {
    development {
        dataSource {
            dbCreate = "update" // one of 'create', 'create-drop', 'update', 'validate', ''
            url = "jdbc:postgresql://localhost:5432/sisviagem_development"
        }
    }
    test {
        dataSource {
            dbCreate = "update"
            url = "jdbc:postgresql://localhost:5432/sisviagem_test"
        }
    }
	production {
		dataSource {
			dbCreate = "update"
			driverClassName = "org.postgresql.Driver"
			dialect = "org.hibernate.dialect.PostgreSQLDialect"

			//uri = new URI(System.env.DATABASE_URL?:"postgres://waxlgsmpdxwuyn:Dg2LK7VoNmF3xVD-gwFO-JDnQU@ec2-54-204-30-115.compute-1.amazonaws.com:5432/dekh0kvv87d1uq")

			url = "jdbc:postgresql://://waxlgsmpdxwuyn:Dg2LK7VoNmF3xVD-gwFO-JDnQU@ec2-54-204-30-115.compute-1.amazonaws.com:5432/dekh0kvv87d1uq"
			username = "waxlgsmpdxwuyn"
			password = "Dg2LK7VoNmF3xVD-gwFO-JDnQU"
		}
	}
}
