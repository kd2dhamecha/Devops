package org.foo

def build() {

node {

            stage('Checkout source') {
                deleteDir()
                checkout scm
            }


def mvn(args) {
  mvn(args, false)
}

def mvn(args, ignoreFailures) {

  def mvnHome = tool 'maven 3.3.9'
  env.PATH = "${mvnHome}/bin:${env.PATH}"

  if (ignoreFailures) {
    sh "set +e; mvn -B ${args} -Dexternal.version-qualifier=${extVerQualifier()}; set -e"
  } else {
    sh "mvn -B ${args} -Dexternal.version-qualifier=${extVerQualifier()}"
  }

}
}
}