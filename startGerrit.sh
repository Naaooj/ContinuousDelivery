#! /bin/bash
# Start the postgres container for gerrit
docker run --name postgres-gerrit \
           -p 5432:5432 \
	   -e POSTGRES_USER=gerrit2 \
	   -e POSTGRES_PASSWORD=gerrit \
           -e POSTGRES_DB=reviewdb \
	   --volume /home/naoj/volumes/postgresql:/var/lib/postgresql \
	   -d postgres

# Start the gerrit container using postgres
docker run --name gerrit \
	   --link postgres-gerrit:db \
	   -p 8080:8080 \
	   -p 29418:29418 \
	   -e DATABASE_TYPE=postgresql \
	   -e WEBURL=http://localhost:8080 \
	   -e AUTH_TYPE=OAUTH \
	   -e OAUTH_GITHUB_CLIENT_ID=8348afaa38ba41d6b183 \
	   -e OAUTH_GITHUB_CLIENT_SECRET=8299922f2439886de7112b131306fd0549cd68c8 \
	   -d openfrontier/gerrit
