# Set all the variables we need for Hadoop

export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/

export HADOOP_VER=hadoop-3.3.1
export HADOOP_ROOT=/opt/$HADOOP_VER
export HADOOP_HOME=$HADOOP_ROOT
export PATH=$PATH:$HADOOP_HOME/sbin:$HADOOP_HOME/bin

# Set further environment variables (Strictly not necessary yet, but will be for Pseudo-mode)
export HADOOP_MAPRED_HOME=$HADOOP_HOME 
export HADOOP_COMMON_HOME=$HADOOP_HOME 
export HADOOP_HDFS_HOME=$HADOOP_HOME 
export YARN_HOME=$HADOOP_HOME 
export HADOOP_COMMON_LIB_NATIVE_DIR=$HADOOP_HOME/lib/native 
export HADOOP_INSTALL=$HADOOP_HOME

export HADOOP_LOG_DIR=/tmp/hadoop-logs

export HADOOP_NAMENODE_USER=vagrant
export HADOOP_DATANODE_USER=vagrant

export PATH=$PATH:/$HADOOP_HOME/bin:/$HADOOP_HOME/sbin
