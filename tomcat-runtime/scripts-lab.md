
Run update.sh

```
update.sh \
    --tomcatVersion 9.0.105 \
    --stopIfReviewRequired false \
    --artifactoryRepositoryBaseUrl https://maven.pkg.github.com/hiconic-os/maven-repo-dev \
    --artifactory-credentials ignored:${GITHUB_READ_PACKAGES_TOKEN} \
    --tomcatJuliArtifact 'com.braintribe.tomcat:logging-juli-extensions#2.0.79' \
    --tomcatExtensionsArtifact 'com.braintribe.tomcat:tomcat-extensions#2.0.10' \
    --devLoaderArtifact 'com.braintribe.devrock.eclipse.devloader:dev-loader#2.0.16'
```


Get maven-metadata.xml of an Artifact

```
curl https://${GITHUB_READ_PACKAGES_TOKEN}@maven.pkg.github.com/hiconic-os/maven-repo-dev/com/braintribe/gm/root-model/maven-metadata.xml

```

sh dlj.sh \
    --tomcatVersion 9.0.105 \
    --stopIfReviewRequired false \
    --artifactoryRepositoryBaseUrl https://maven.pkg.github.com/hiconic-os/maven-repo-dev \
    --artifactory-credentials ignored:${GITHUB_READ_PACKAGES_TOKEN} \
    --tomcatJuliArtifact 'com.braintribe.tomcat:logging-juli-extensions#2.0.79' \
    --tomcatExtensionsArtifact 'com.braintribe.tomcat:tomcat-extensions#2.0.10' \
    --devLoaderArtifact 'com.braintribe.devrock.eclipse.devloader:dev-loader#2.0.16'
