#Host where ambari-server is running. Can be the the same with one of agent host
SERVER_HOST=`hostname -f`

AGENT_HOST1="1.agenthost.com"
AGENT_HOST2="1.agenthost.com"

echo SERVER_HOST=$SERVER_HOST
echo AGENT_HOST1=$AGENT_HOST1
echo AGENT_HOST2=$AGENT_HOST2

echo '########### Create cluster ###########'
curl -i -X POST -d "{\"Clusters\": {\"version\" : \"HDP-1.2.0\"}}" http://$SERVER_HOST:8080/api/v1/clusters/c1
echo '########### Set service names ###########'
curl -i -X POST -d "[{\"ServiceInfo\":{\"service_name\":\"HDFS\"}},{\"ServiceInfo\":{\"service_name\":\"MAPREDUCE\"}},{\"ServiceInfo\":{\"service_name\":\"NAGIOS\"}},{\"ServiceInfo\":{\"service_name\":\"GANGLIA\"}},{\"ServiceInfo\":{\"service_name\":\"HBASE\"}},{\"ServiceInfo\":{\"service_name\":\"ZOOKEEPER\"}}]" http://$SERVER_HOST:8080/api/v1/clusters/c1/services
echo '########### Create configs ###########'

echo '########### Create global config ###########'
curl -i -X POST -d "{\"type\":\"global\",\"tag\":\"version1\",\"properties\":{\"dfs_name_dir\":\"/hadoop/hdfs/namenode\",\"fs_checkpoint_dir\":\"/hadoop/hdfs/namesecondary\",\"dfs_data_dir\":\"/hadoop/hdfs/data\",\"hdfs_log_dir_prefix\":\"/var/log/hadoop\",\"hadoop_pid_dir_prefix\":\"/var/run/hadoop\",\"dfs_webhdfs_enabled\":false,\"hadoop_heapsize\":\"1024\",\"namenode_heapsize\":\"1024m\",\"namenode_opt_newsize\":\"200m\",\"namenode_opt_maxnewsize\":\"640m\",\"datanode_du_reserved\":\"1\",\"dtnode_heapsize\":\"1024m\",\"dfs_datanode_failed_volume_tolerated\":\"0\",\"fs_checkpoint_period\":\"21600\",\"fs_checkpoint_size\":\"0.5\",\"dfs_exclude\":\"dfs.exclude\",\"dfs_include\":\"dfs.include\",\"dfs_replication\":\"3\",\"dfs_block_local_path_access_user\":\"hbase\",\"dfs_datanode_data_dir_perm\":\"750\",\"security_enabled\":false,\"kerberos_domain\":\"EXAMPLE.COM\",\"kadmin_pw\":\"\",\"keytab_path\":\"/etc/security/keytabs\",\"namenode_formatted_mark_dir\":\"/var/run/hadoop/hdfs/namenode/formatted/\",\"hcat_conf_dir\":\"\",\"mapred_local_dir\":\"/hadoop/mapred\",\"mapred_system_dir\":\"/mapred/system\",\"scheduler_name\":\"org.apache.hadoop.mapred.CapacityTaskScheduler\",\"jtnode_opt_newsize\":\"200m\",\"jtnode_opt_maxnewsize\":\"200m\",\"jtnode_heapsize\":\"1024m\",\"mapred_map_tasks_max\":\"4\",\"mapred_red_tasks_max\":\"2\",\"mapred_cluster_map_mem_mb\":\"-1\",\"mapred_cluster_red_mem_mb\":\"-1\",\"mapred_cluster_max_map_mem_mb\":\"-1\",\"mapred_cluster_max_red_mem_mb\":\"-1\",\"mapred_job_map_mem_mb\":\"-1\",\"mapred_job_red_mem_mb\":\"-1\",\"mapred_child_java_opts_sz\":\"768\",\"io_sort_mb\":\"200\",\"io_sort_spill_percent\":\"0.9\",\"mapreduce_userlog_retainhours\":\"24\",\"maxtasks_per_job\":\"-1\",\"lzo_enabled\":false,\"snappy_enabled\":true,\"rca_enabled\":true,\"mapred_hosts_exclude\":\"mapred.exclude\",\"mapred_hosts_include\":\"mapred.include\",\"mapred_jobstatus_dir\":\"file:////mapred/jobstatus\",\"task_controller\":\"org.apache.hadoop.mapred.DefaultTaskController\",\"hbase_log_dir\":\"/var/log/hbase\",\"hbase_pid_dir\":\"/var/run/hbase\",\"hbase_regionserver_heapsize\":\"1024m\",\"hbase_master_heapsize\":\"1024m\",\"hstore_compactionthreshold\":\"3\",\"hfile_blockcache_size\":\"0.25\",\"hstorefile_maxsize\":\"1073741824\",\"regionserver_handlers\":\"30\",\"hregion_majorcompaction\":\"86400000\",\"hregion_blockmultiplier\":\"2\",\"hregion_memstoreflushsize\":\"134217728\",\"client_scannercaching\":\"100\",\"zookeeper_sessiontimeout\":\"60000\",\"hfile_max_keyvalue_size\":\"10485760\",\"hbase_hdfs_root_dir\":\"/apps/hbase/data\",\"hbase_tmp_dir\":\"/var/log/hbase\",\"hdfs_enable_shortcircuit_read\":true,\"hdfs_enable_shortcircuit_skipchecksum\":false,\"hdfs_support_append\":true,\"hstore_blockingstorefiles\":7,\"regionserver_memstore_lab\":true,\"regionserver_memstore_lowerlimit\":\"0.35\",\"regionserver_memstore_upperlimit\":\"0.4\",\"zk_data_dir\":\"/hadoop/zookeeper\",\"zk_log_dir\":\"/var/log/zookeeper\",\"zk_pid_dir\":\"/var/run/zookeeper\",\"zk_pid_file\":\"/var/run/zookeeper/zookeeper_server.pid\",\"tickTime\":\"2000\",\"initLimit\":\"10\",\"syncLimit\":\"5\",\"clientPort\":\"2181\",\"nagios_user\":\"nagios\",\"nagios_group\":\"nagios\",\"nagios_web_login\":\"nagiosadmin\",\"nagios_web_password\":\"password\",\"nagios_contact\":\"x@x.x\",\"hbase_conf_dir\":\"/etc/hbase\",\"proxyuser_group\":\"users\",\"dfs_datanode_address\":\"50010\",\"dfs_datanode_http_address\":\"50075\",\"gpl_artifacts_download_url\":\"\",\"apache_artifacts_download_url\":\"\",\"ganglia_runtime_dir\":\"/var/run/ganglia/hdp\",\"gmetad_user\":\"nobody\",\"gmond_user\":\"nobody\",\"ganglia_shell_cmds_dir\":\"/usr/libexec/hdp/ganglia\",\"webserver_group\":\"apache\",\"java64_home\":\"/usr/jdk/jdk1.6.0_31\",\"run_dir\":\"/var/run/hadoop\",\"hadoop_conf_dir\":\"/etc/hadoop\",\"hcat_metastore_port\":\"/usr/lib/hcatalog/share/hcatalog\",\"hcat_lib\":\"/usr/lib/hcatalog/share/hcatalog\",\"hcat_dbroot\":\"/usr/lib/hcatalog/share/hcatalog\",\"hdfs_user\":\"hdfs\",\"mapred_user\":\"mapred\",\"hbase_user\":\"hbase\",\"hive_user\":\"hive\",\"hcat_user\":\"hcat\",\"webhcat_user\":\"hcat\",\"oozie_user\":\"oozie\",\"oozie_conf_dir\":\"/etc/oozie\",\"pig_conf_dir\":\"/etc/pig\",\"pig_user\":\"pig\",\"sqoop_conf_dir\":\"/etc/sqoop\",\"sqoop_lib\":\"/usr/lib/sqoop/lib/\",\"sqoop_user\":\"sqoop\",\"zk_user\":\"zookeeper\",\"user_group\":\"hadoop\",\"zk_conf_dir\":\"/etc/conf/\"}}" http://$SERVER_HOST:8080/api/v1/clusters/c1/configurations
echo '########### Create core-site config ###########'
curl -i -X POST -d "{\"type\":\"core-site\",\"tag\":\"version1\",\"properties\":{\"io.file.buffer.size\":\"131072\",\"io.serializations\":\"org.apache.hadoop.io.serializer.WritableSerialization\",\"io.compression.codec.lzo.class\":\"com.hadoop.compression.lzo.LzoCodec\",\"fs.trash.interval\":\"360\",\"ipc.client.idlethreshold\":\"8000\",\"ipc.client.connection.maxidletime\":\"30000\",\"ipc.client.connect.max.retries\":\"50\",\"webinterface.private.actions\":\"false\",\"fs.default.name\":\"hdfs://1.ambari.ua:8020\",\"fs.checkpoint.dir\":\"/hadoop/hdfs/namesecondary\",\"fs.checkpoint.period\":\"21600\",\"fs.checkpoint.size\":\"0.5\",\"fs.checkpoint.edits.dir\":\"/hadoop/hdfs/namesecondary\"}}" http://$SERVER_HOST:8080/api/v1/clusters/c1/configurations
echo '########### Create hdfs-site config ###########'
curl -i -X POST -d "{\"type\":\"hdfs-site\",\"tag\":\"version1\",\"properties\":{\"dfs.datanode.socket.write.timeout\":\"0\",\"dfs.replication.max\":\"50\",\"dfs.heartbeat.interval\":\"3\",\"dfs.safemode.threshold.pct\":\"1.0f\",\"dfs.balance.bandwidthPerSec\":\"6250000\",\"dfs.block.size\":\"134217728\",\"dfs.datanode.ipc.address\":\"0.0.0.0:8010\",\"dfs.blockreport.initialDelay\":\"120\",\"dfs.datanode.du.pct\":\"0.85f\",\"dfs.namenode.handler.count\":\"40\",\"dfs.datanode.max.xcievers\":\"4096\",\"dfs.umaskmode\":\"077\",\"dfs.web.ugi\":\"gopher,gopher\",\"dfs.permissions\":\"true\",\"dfs.permissions.supergroup\":\"hdfs\",\"ipc.server.max.response.size\":\"5242880\",\"dfs.block.access.token.enable\":\"true\",\"dfs.secondary.https.port\":\"50490\",\"dfs.https.port\":\"50470\",\"dfs.access.time.precision\":\"0\",\"dfs.cluster.administrators\":\" hdfs\",\"ipc.server.read.threadpool.size\":\"5\",\"dfs.name.dir\":\"/hadoop/hdfs/namenode\",\"dfs.webhdfs.enabled\":\"false\",\"dfs.datanode.failed.volumes.tolerated\":\"0\",\"dfs.block.local-path-access.user\":\"hbase\",\"dfs.data.dir\":\"/hadoop/hdfs/data\",\"dfs.hosts.exclude\":\"/etc/hadoop/dfs.exclude\",\"dfs.hosts\":\"/etc/hadoop/dfs.include\",\"dfs.replication\":\"3\",\"dfs.datanode.address\":\"0.0.0.0:50010\",\"dfs.datanode.http.address\":\"0.0.0.0:50075\",\"dfs.http.address\":\"1.ambari.ua:50070\",\"dfs.datanode.du.reserved\":\"1\",\"dfs.namenode.kerberos.principal\":\"nn/_HOST@EXAMPLE.COM\",\"dfs.secondary.namenode.kerberos.principal\":\"nn/_HOST@EXAMPLE.COM\",\"dfs.namenode.kerberos.https.principal\":\"host/_HOST@EXAMPLE.COM\",\"dfs.secondary.namenode.kerberos.https.principal\":\"host/_HOST@EXAMPLE.COM\",\"dfs.secondary.http.address\":\"2.ambari.ua:50090\",\"dfs.web.authentication.kerberos.keytab\":\"/etc/security/keytabs/spnego.service.keytab\",\"dfs.datanode.kerberos.principal\":\"dn/_HOST@EXAMPLE.COM\",\"dfs.namenode.keytab.file\":\"/etc/security/keytabs/nn.service.keytab\",\"dfs.secondary.namenode.keytab.file\":\"/etc/security/keytabs/nn.service.keytab\",\"dfs.datanode.keytab.file\":\"/etc/security/keytabs/dn.service.keytab\",\"dfs.https.address\":\"1.ambari.ua:50470\",\"dfs.datanode.data.dir.perm\":\"750\"}}" http://$SERVER_HOST:8080/api/v1/clusters/c1/configurations
echo '########### Create mapred-site config ###########'
curl -i -X POST -d "{\"type\":\"mapred-site\",\"tag\":\"version1\",\"properties\":{\"io.sort.record.percent\":\".2\",\"io.sort.factor\":\"100\",\"mapred.tasktracker.tasks.sleeptime-before-sigkill\":\"250\",\"mapred.job.tracker.handler.count\":\"50\",\"mapreduce.cluster.administrators\":\" hadoop\",\"mapred.reduce.parallel.copies\":\"30\",\"tasktracker.http.threads\":\"50\",\"mapred.map.tasks.speculative.execution\":\"false\",\"mapred.reduce.tasks.speculative.execution\":\"false\",\"mapred.reduce.slowstart.completed.maps\":\"0.05\",\"mapred.inmem.merge.threshold\":\"1000\",\"mapred.job.shuffle.merge.percent\":\"0.66\",\"mapred.job.shuffle.input.buffer.percent\":\"0.7\",\"mapred.output.compression.type\":\"BLOCK\",\"mapred.jobtracker.completeuserjobs.maximum\":\"0\",\"mapred.jobtracker.restart.recover\":\"false\",\"mapred.job.reduce.input.buffer.percent\":\"0.0\",\"mapreduce.reduce.input.limit\":\"10737418240\",\"mapred.task.timeout\":\"600000\",\"jetty.connector\":\"org.mortbay.jetty.nio.SelectChannelConnector\",\"mapred.child.root.logger\":\"INFO,TLA\",\"mapred.max.tracker.blacklists\":\"16\",\"mapred.healthChecker.interval\":\"135000\",\"mapred.healthChecker.script.timeout\":\"60000\",\"mapred.job.tracker.persist.jobstatus.active\":\"false\",\"mapred.job.tracker.persist.jobstatus.hours\":\"1\",\"mapred.jobtracker.retirejob.check\":\"10000\",\"mapred.jobtracker.retirejob.interval\":\"0\",\"mapred.job.tracker.history.completed.location\":\"/mapred/history/done\",\"mapreduce.fileoutputcommitter.marksuccessfuljobs\":\"false\",\"mapred.job.reuse.jvm.num.tasks\":\"1\",\"hadoop.job.history.user.location\":\"none\",\"mapreduce.jobtracker.staging.root.dir\":\"/user\",\"mapreduce.tasktracker.group\":\"hadoop\",\"mapreduce.jobtracker.split.metainfo.maxsize\":\"50000000\",\"mapred.jobtracker.blacklist.fault-timeout-window\":\"180\",\"mapred.jobtracker.blacklist.fault-bucket-width\":\"15\",\"mapred.queue.names\":\"default\",\"mapred.local.dir\":\"/hadoop/mapred\",\"mapred.jobtracker.taskScheduler\":\"org.apache.hadoop.mapred.CapacityTaskScheduler\",\"mapred.tasktracker.map.tasks.maximum\":\"4\",\"mapred.tasktracker.reduce.tasks.maximum\":\"2\",\"mapred.cluster.reduce.memory.mb\":\"-1\",\"mapred.job.map.memory.mb\":\"-1\",\"mapred.cluster.max.map.memory.mb\":\"-1\",\"mapred.cluster.max.reduce.memory.mb\":\"-1\",\"mapred.job.reduce.memory.mb\":\"-1\",\"mapred.hosts\":\"/etc/hadoop/mapred.include\",\"mapred.hosts.exclude\":\"/etc/hadoop/mapred.exclude\",\"mapred.healthChecker.script.path\":\"file:////mapred/jobstatus\",\"mapred.job.tracker.persist.jobstatus.dir\":\"/etc/hadoop/health_check\",\"mapred.child.java.opts\":\"-server -Xmx768m -Djava.net.preferIPv4Stack=true\",\"mapred.cluster.map.memory.mb\":\"-1\",\"io.sort.mb\":\"200\",\"io.sort.spill.percent\":\"0.9\",\"mapred.system.dir\":\"/mapred/system\",\"mapred.job.tracker\":\"2.ambari.ua:50300\",\"mapred.job.tracker.http.address\":\"2.ambari.ua:50030\",\"mapred.userlog.retain.hours\":\"24\",\"mapred.jobtracker.maxtasks.per.job\":\"-1\",\"mapred.task.tracker.task-controller\":\"org.apache.hadoop.mapred.DefaultTaskController\",\"mapreduce.jobtracker.kerberos.principal\":\"jt/_HOST@EXAMPLE.COM\",\"mapreduce.tasktracker.kerberos.principal\":\"tt/_HOST@EXAMPLE.COM\",\"mapreduce.jobtracker.keytab.file\":\"/etc/security/keytabs/jt.service.keytab\",\"mapreduce.tasktracker.keytab.file\":\"/etc/security/keytabs/tt.service.keytab\",\"mapreduce.history.server.embedded\":\"false\",\"mapreduce.history.server.http.address\":\"2.ambari.ua:51111\",\"mapreduce.jobhistory.kerberos.principal\":\"jt/_HOST@EXAMPLE.COM\",\"mapreduce.jobhistory.keytab.file\":\"/etc/security/keytabs/jt.service.keytab\"}}" http://$SERVER_HOST:8080/api/v1/clusters/c1/configurations
echo '########### Create hbase-site config ###########'
curl -i -X POST -d "{\"type\":\"hbase-site\",\"tag\":\"version1\",\"properties\":{\"hbase.master.lease.thread.wakefrequency\":\"3000\",\"hbase.superuser\":\"hbase\",\"hbase.regionserver.optionalcacheflushinterval\":\"10000\",\"hbase.rootdir\":\"hdfs://1.ambari.ua:8020/apps/hbase/data\",\"hbase.tmp.dir\":\"/var/log/hbase\",\"hbase.regionserver.global.memstore.upperLimit\":\"0.4\",\"hbase.hstore.blockingStoreFiles\":\"7\",\"hbase.hstore.compactionThreshold\":\"3\",\"hfile.block.cache.size\":\"0.25\",\"hbase.hregion.max.filesize\":\"1073741824\",\"hbase.regionserver.handler.count\":\"30\",\"hbase.hregion.majorcompaction\":\"86400000\",\"hbase.regionserver.global.memstore.lowerLimit\":\"0.35\",\"hbase.hregion.memstore.block.multiplier\":\"2\",\"hbase.hregion.memstore.mslab.enabled\":\"true\",\"hbase.hregion.memstore.flush.size\":\"134217728\",\"hbase.client.scanner.caching\":\"100\",\"hbase.cluster.distributed\":\"true\",\"hbase.zookeeper.property.clientPort\":\"2181\",\"zookeeper.session.timeout\":\"60000\",\"hbase.client.keyvalue.maxsize\":\"10485760\",\"hbase.master.keytab.file\":\"/etc/security/keytabs/hm.service.keytab\",\"hbase.master.kerberos.principal\":\"hm/_HOST@EXAMPLE.COM\",\"hbase.regionserver.kerberos.principal\":\"rs/_HOST@EXAMPLE.COM\",\"dfs.support.append\":\"true\",\"dfs.client.read.shortcircuit\":\"true\",\"dfs.client.read.shortcircuit.skip.checksum\":\"false\",\"hbase.zookeeper.quorum\":\"1.ambari.ua\"}}" http://$SERVER_HOST:8080/api/v1/clusters/c1/configurations
echo '########### Attach configs to HDFS ###########'  
curl -i -X PUT -d "{\"config\":{\"global\":\"version1\",\"core-site\":\"version1\",\"hdfs-site\":\"version1\"}}" http://$SERVER_HOST:8080/api/v1/clusters/c1/services/HDFS
echo '########### Attach configs to MAPREDUCE ###########'
curl -i -X PUT -d "{\"config\":{\"global\":\"version1\",\"core-site\":\"version1\",\"mapred-site\":\"version1\"}}" http://$SERVER_HOST:8080/api/v1/clusters/c1/services/MAPREDUCE
echo '########### Attach configs to NAGIOS ###########'
curl -i -X PUT -d "{\"config\":{\"global\":\"version1\"}}" http://$SERVER_HOST:8080/api/v1/clusters/c1/services/NAGIOS
echo '########### Attach configs to GANGLIA ###########'
curl -i -X PUT -d "{\"config\":{\"global\":\"version1\"}}" http://$SERVER_HOST:8080/api/v1/clusters/c1/services/GANGLIA
echo '########### Attach configs to HBASE ###########'
curl -i -X PUT -d "{\"config\":{\"global\":\"version1\",\"hbase-site\":\"version1\"}}" http://$SERVER_HOST:8080/api/v1/clusters/c1/services/HBASE
echo '########### Attach configs to ZOOKEEPER ###########'
curl -i -X PUT -d "{\"config\":{\"global\":\"version1\"}}" http://$SERVER_HOST:8080/api/v1/clusters/c1/services/ZOOKEEPER
echo '########### Add components to HDFS ###########'
curl -i -X POST -d "{\"components\":[{\"ServiceComponentInfo\":{\"component_name\":\"NAMENODE\"}},{\"ServiceComponentInfo\":{\"component_name\":\"SECONDARY_NAMENODE\"}},{\"ServiceComponentInfo\":{\"component_name\":\"DATANODE\"}},{\"ServiceComponentInfo\":{\"component_name\":\"HDFS_CLIENT\"}}]}" http://$SERVER_HOST:8080/api/v1/clusters/c1/services?ServiceInfo/service_name=HDFS
echo '########### Add components to MAPREDUCE ###########'
curl -i -X POST -d "{\"components\":[{\"ServiceComponentInfo\":{\"component_name\":\"JOBTRACKER\"}},{\"ServiceComponentInfo\":{\"component_name\":\"TASKTRACKER\"}},{\"ServiceComponentInfo\":{\"component_name\":\"MAPREDUCE_CLIENT\"}}]}" http://$SERVER_HOST:8080/api/v1/clusters/c1/services?ServiceInfo/service_name=MAPREDUCE
echo '########### Add components to NAGIOS ###########'
curl -i -X POST -d "{\"components\":[{\"ServiceComponentInfo\":{\"component_name\":\"NAGIOS_SERVER\"}}]}" http://$SERVER_HOST:8080/api/v1/clusters/c1/services?ServiceInfo/service_name=NAGIOS
echo '########### Add components to GANGLIA ###########'
curl -i -X POST -d "{\"components\":[{\"ServiceComponentInfo\":{\"component_name\":\"GANGLIA_SERVER\"}},{\"ServiceComponentInfo\":{\"component_name\":\"GANGLIA_MONITOR\"}}]}" http://$SERVER_HOST:8080/api/v1/clusters/c1/services?ServiceInfo/service_name=GANGLIA
echo '########### Add components to HBASE ###########'
curl -i -X POST -d "{\"components\":[{\"ServiceComponentInfo\":{\"component_name\":\"HBASE_MASTER\"}},{\"ServiceComponentInfo\":{\"component_name\":\"HBASE_REGIONSERVER\"}},{\"ServiceComponentInfo\":{\"component_name\":\"HBASE_CLIENT\"}}]}" http://$SERVER_HOST:8080/api/v1/clusters/c1/services?ServiceInfo/service_name=HBASE
echo '########### Add components to ZOOKEEPER ###########'
curl -i -X POST -d "{\"components\":[{\"ServiceComponentInfo\":{\"component_name\":\"ZOOKEEPER_SERVER\"}},{\"ServiceComponentInfo\":{\"component_name\":\"ZOOKEEPER_CLIENT\"}}]}" http://$SERVER_HOST:8080/api/v1/clusters/c1/services?ServiceInfo/service_name=ZOOKEEPER
echo '########### Add hosts ###########'
curl -i -X POST -d "[{\"Hosts\":{\"host_name\":\"$AGENT_HOST1\"}}, {\"Hosts\":{\"host_name\":\"$AGENT_HOST2\"}}]" http://$SERVER_HOST:8080/api/v1/clusters/c1/hosts
echo '########### Deploy components to hosts ###########'

curl -i -X POST -d "{\"host_components\":[{\"HostRoles\":{\"component_name\":\"NAMENODE\"}}]}" http://$SERVER_HOST:8080/api/v1/clusters/c1/hosts?Hosts/host_name=$AGENT_HOST1
curl -i -X POST -d "{\"host_components\":[{\"HostRoles\":{\"component_name\":\"SECONDARY_NAMENODE\"}}]}" http://$SERVER_HOST:8080/api/v1/clusters/c1/hosts?Hosts/host_name=$AGENT_HOST2
curl -i -X POST -d "{\"host_components\":[{\"HostRoles\":{\"component_name\":\"JOBTRACKER\"}}]}" http://$SERVER_HOST:8080/api/v1/clusters/c1/hosts?Hosts/host_name=$AGENT_HOST2
curl -i -X POST -d "{\"host_components\":[{\"HostRoles\":{\"component_name\":\"NAGIOS_SERVER\"}}]}" http://$SERVER_HOST:8080/api/v1/clusters/c1/hosts?Hosts/host_name=$AGENT_HOST1
curl -i -X POST -d "{\"host_components\":[{\"HostRoles\":{\"component_name\":\"GANGLIA_SERVER\"}}]}" http://$SERVER_HOST:8080/api/v1/clusters/c1/hosts?Hosts/host_name=$AGENT_HOST1
curl -i -X POST -d "{\"host_components\":[{\"HostRoles\":{\"component_name\":\"HBASE_MASTER\"}}]}" "http://$SERVER_HOST:8080/api/v1/clusters/c1/hosts?Hosts/host_name=$AGENT_HOST1|Hosts/host_name=$AGENT_HOST2"
curl -i -X POST -d "{\"host_components\":[{\"HostRoles\":{\"component_name\":\"ZOOKEEPER_SERVER\"}}]}" http://$SERVER_HOST:8080/api/v1/clusters/c1/hosts?Hosts/host_name=$AGENT_HOST1
curl -i -X POST -d "{\"host_components\":[{\"HostRoles\":{\"component_name\":\"DATANODE\"}}]}" "http://$SERVER_HOST:8080/api/v1/clusters/c1/hosts?Hosts/host_name=$AGENT_HOST1|Hosts/host_name=$AGENT_HOST2"
curl -i -X POST -d "{\"host_components\":[{\"HostRoles\":{\"component_name\":\"TASKTRACKER\"}}]}" "http://$SERVER_HOST:8080/api/v1/clusters/c1/hosts?Hosts/host_name=$AGENT_HOST1|Hosts/host_name=$AGENT_HOST2"
curl -i -X POST -d "{\"host_components\":[{\"HostRoles\":{\"component_name\":\"HBASE_REGIONSERVER\"}}]}" "http://$SERVER_HOST:8080/api/v1/clusters/c1/hosts?Hosts/host_name=$AGENT_HOST1|Hosts/host_name=$AGENT_HOST2"
curl -i -X POST -d "{\"host_components\":[{\"HostRoles\":{\"component_name\":\"HDFS_CLIENT\"}}]}" "http://$SERVER_HOST:8080/api/v1/clusters/c1/hosts?Hosts/host_name=$AGENT_HOST1|Hosts/host_name=$AGENT_HOST2"
curl -i -X POST -d "{\"host_components\":[{\"HostRoles\":{\"component_name\":\"MAPREDUCE_CLIENT\"}}]}" "http://$SERVER_HOST:8080/api/v1/clusters/c1/hosts?Hosts/host_name=$AGENT_HOST1|Hosts/host_name=$AGENT_HOST2"
curl -i -X POST -d "{\"host_components\":[{\"HostRoles\":{\"component_name\":\"HBASE_CLIENT\"}}]}" "http://$SERVER_HOST:8080/api/v1/clusters/c1/hosts?Hosts/host_name=$AGENT_HOST1|Hosts/host_name=$AGENT_HOST2"
curl -i -X POST -d "{\"host_components\":[{\"HostRoles\":{\"component_name\":\"ZOOKEEPER_CLIENT\"}}]}" "http://$SERVER_HOST:8080/api/v1/clusters/c1/hosts?Hosts/host_name=$AGENT_HOST1|Hosts/host_name=$AGENT_HOST2"
curl -i -X POST -d "{\"host_components\":[{\"HostRoles\":{\"component_name\":\"GANGLIA_MONITOR\"}}]}" "http://$SERVER_HOST:8080/api/v1/clusters/c1/hosts?Hosts/host_name=$AGENT_HOST1|Hosts/host_name=$AGENT_HOST2"
echo '########### Waiting for istall services ###########'
#Next command provide waiting until cluster components initiation complete. This command could be run manually. If you want it run manually, uncomment they.
#sleep 1200
#curl -i -X PUT -d "{\"ServiceInfo\": {\"state\": \"INSTALLED\"}}" http://$SERVER_HOST:8080/api/v1/clusters/c1/services?ServiceInfo/state=INIT
echo '########### Waiting for start services ###########'
#Next command provide waiting until cluster components installation complete. This command could be run manually. If you want it run manually, uncomment they.
#sleep 1200
#curl -i -X PUT -d "{\"ServiceInfo\": {\"state\": \"STARTED\"}}" http://$SERVER_HOST:8080/api/v1/clusters/c1/services?ServiceInfo/state=INSTALLED

#This is example calling of installation and running manually
#sleep 1200 && curl -i -X PUT -d "{\"ServiceInfo\": {\"state\": \"INSTALLED\"}}" http://localhost:8080/api/v1/clusters/c1/services?ServiceInfo/state=INIT && sleep 1200 && curl -i -X PUT -d "{\"ServiceInfo\": {\"state\": \"STARTED\"}}" http://localhost:8080/api/v1/clusters/c1/services?ServiceInfo/state=INSTALLED


