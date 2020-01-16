#!/bin/sh
JARS_DIR="$1"
OUTPUT_DIR="$2"

extract () {
  jar_file="$1"
  extract_dir="$OUTPUT_DIR/${1%.jar}"
  unzip -d "$extract_dir" "$jar_file"

  if [ -d "$extract_dir"/resources ]; then rm -rf "$extract_dir"/resources; fi
  if [ -d "$extract_dir"/resource ]; then rm -rf "$extract_dir"/resource; fi
}

rm -rf "$OUTPUT_DIR"/*

cd "$JARS_DIR"
for jar in $(ls ./*katalon*.jar)
do
  extract $jar
done

cd $OUTPUT_DIR
rm com.kms.katalon.execution.webservice*/com/kms/katalon/execution/webservice/contribution/WebServiceConfigurationContributor.class