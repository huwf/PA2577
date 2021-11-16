
class hadoop {
  $hadoop_version = 'hadoop-3.3.1'
  $hadoop_home = "/opt/${hadoop_version}"
  $hadoop_url = "https://dlcdn.apache.org/hadoop/common/${hadoop_version}/${hadoop_version}.tar.gz"

  contain hadoop::install
  contain hadoop::config
}

