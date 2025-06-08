#!/bin/bash

# For a given groupId and artifactId returns the relative path to the maven-metadata.xml
# Example:
# Arg 1:  abc.artifact.group
# Arg 2:  xyz-artifact
# Result: abc/artifact/group/xyz-artifact/maven-metadata.xml (returned via echo)
function repositoryAritfactMetadataXmlRelativePath() {
	local groupId=$1
	local artifactId=$2
	local result="${groupId//\./\/}/${artifactId}/maven-metadata.xml"
	# return result via echo
	echo ${result}
}

get_latest_maven_version_from_versions() {
  local GROUP_ID="$1"
  local ARTIFACT_ID="$2"

  local GITHUB_TOKEN="$GITHUB_READ_PACKAGES_TOKEN"
  local REPO_OWNER="hiconic-os"
  local REPO_NAME="maven-repo-dev"
  local ARTIFACTORY_REPOSITORY_BASE_URL="https://maven.pkg.github.com/${REPO_OWNER}/${REPO_NAME}"

  if [ -z "$GROUP_ID" ] || [ -z "$ARTIFACT_ID" ] || [ -z "$GITHUB_READ_PACKAGES_TOKEN" ]; then
    echo "Usage: get_latest_maven_version_from_versions <group_id> <artifact_id> <github_token>" >&2
    return 1
  fi

  # Construct the URL, replacing dots in group ID with slashes
  #local URL="https://maven.pkg.github.com/${REPO_OWNER}/${REPO_NAME}/${GROUP_ID//.//}/${ARTIFACT_ID}/maven-metadata.xml"
  local URL="${ARTIFACTORY_REPOSITORY_BASE_URL}/$(repositoryAritfactMetadataXmlRelativePath ${GROUP_ID} ${ARTIFACT_ID})"

  # Fetch the XML using curl
  # -s: silent mode (no progress meter)
  # -f: fail fast (exit with error on HTTP errors like 404)
  local CURL_OUTPUT
  CURL_OUTPUT=$(curl -s -f --user "ignored:${GITHUB_TOKEN}" "$URL")

  # Check if curl command was successful
  if [ $? -ne 0 ]; then
    printf "Error: Failed to fetch maven-metadata.xml for ${GROUP_ID}:${ARTIFACT_ID}.\nURL: $URL\n\n" >&2
    return 1
  fi

  # Process the XML to get the last version.
  # This pattern looks for <version> tags and extracts their content.
  # Then, 'tail -n 1' gets the very last one.
  local LATEST_VERSION
  LATEST_VERSION=$(echo "$CURL_OUTPUT" | grep -oP '<version>\K[^<]+' | tail -n 1)

  if [ -z "$LATEST_VERSION" ]; then
    echo "Error: Could not find any '<version>' tags in the XML response for ${GROUP_ID}:${ARTIFACT_ID}." >&2
    return 1
  fi

  echo "Latest ${GROUP_ID}:${ARTIFACT_ID}:   $LATEST_VERSION"
}

# --- Example Usage ---
# Set your GitHub token (replace with your actual token or ensure it's in your environment)
# export GITHUB_READ_PACKAGES_TOKEN="ghp_your_actual_token_here"

# Call the function
get_latest_maven_version_from_versions "com.braintribe.tomcat" "logging-juli-extensions"

get_latest_maven_version_from_versions "com.braintribe.tomcat" "tomcat-extensions"

get_latest_maven_version_from_versions "com.braintribe.devrock.eclipse.devloader" "dev-loader"
