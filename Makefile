.PHONY: fmt test npm

fmt:
	npm run fmt

.npmrc:
	echo '@guardianproject-ops:registry=https://gitlab.com/api/v4/packages/npm/' > .npmrc
	echo '//gitlab.com/api/v4/packages/npm/:_authToken=${CI_JOB_TOKEN}' >> .npmrc
	echo '//gitlab.com/api/v4/projects/:_authToken=${CI_JOB_TOKEN}' >> .npmrc
	echo '//gitlab.com/api/v4/projects/21522148/packages/npm/:_authToken=${CI_JOB_TOKEN}' >> .npmrc

npm:
	npm install

test: npm
	npm test
	npm run lint

publish: test .npmrc
	npm run publish

