#erlc -o src/gpb/gpb_scan.erl src/gpb/gpb_scan.xrl
#erlc -I include -o ebin src/*.erl
#erlc -I include -o ebin src/base/*.erl
#erlc -I include -o ebin src/gpb/*.erl
#erlc -I include -o ebin src/logger/*.erl
#erlc -I include -o ebin src/mysql/*.erl
#erlc -I include -o ebin src/player/*.erl
#erlc -I include -o ebin src/proto/*.erl
#erlc -I include -o ebin src/tool/*.erl
dir=`dirname $0`
cd $dir
url=`pwd`
cd $url
ERLC=/usr/local/lib/erlang/bin/erlc
ERL=/usr/local/lib/erlang/bin/erl
DATETIME=`date "+%Y%m%d-%H%M%S"`
PROCESSES=8
MAKE_OPTS="{d,glendy},{d,'DEBUG_BUILD',true},{d, 'NO_HAVE_STACKTRACE_SYNTAX', true},debug_info"
#echo "%%--- coding:utf-8 ---" > src/tool/game_version.erl
#echo "-module(game_version)." >> src/tool/game_version.erl
#echo "-compile(export_all)." >> src/tool/game_version.erl
#echo "v()->\"${DATETIME}\"." >> src/tool/game_version.erl
${ERLC} -o src/gpb/gpb_parse.erl src/gpb/gpb_parse.yrl
${ERLC} -o src/gpb/gpb_scan.erl src/gpb/gpb_scan.xrl
${ERL} -noinput -eval "case make:files([\"src/tool/mmake.erl\"],[debug_info, {outdir, \"ebin\"},{i, \"include\"},{time,\"${DATETIME}\"}]) of error -> halt(1); _ -> halt(0) end"
${ERL} -noinput -eval "case make:files([\"src/util/mod_server.erl\"],[debug_info, {outdir,\"ebin\"},{i, \"include\"},{time,\"${DATETIME}\"}]) of error -> halt(1); _ -> halt(0) end"
#${ERL} -noinput -eval "case make:files([\"src/gpb/gpb_codegen.erl\"],[debug_info, {outdir,\"ebin\"},{i, \"include\"},{time,\"${DATETIME}\"}]) of error -> halt(1); _ -> halt(0) end"
#${ERL} -noinput -eval "case make:files([\"src/mongodb/mod_mongo.erl\"],[debug_info, {outdir, \"ebin\"},{i, \"include\"},{time,\"${DATETIME}\"}]) of error -> halt(1); _ -> halt(0) end"
${ERL} -pa ./ebin -noinput -eval "case mmake:all(${PROCESSES},[${MAKE_OPTS},{outdir, \"ebin\"},{i, \"include\"},{time,\"${DATETIME}\"}]) of up_to_date -> halt(0); error -> halt(1) end."
/bin/cp config/*.app ebin/
#/bin/cp base/* ebin/
/bin/cp jsx/* ebin/
/bin/cp src/data_conf/mapCityTrrigerDic.json ebin/
/bin/cp src/data_conf/world_map.json ebin/
/bin/cp src/data_conf/demo_map.json ebin/
/bin/cp src/data_conf/tile/*.txt ebin/