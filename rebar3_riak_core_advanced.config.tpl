[
 { {{ name }}, []},
 {riak_core, [
   {schema_dirs, ["share/schema"]}
   %% {{ name }} valid permissions to grant
   % {permissions, [{ {{ name }}, [put, get, list, grant, delete]}]}
 ]},
 %% SASL config
 {sasl, [
         {sasl_error_logger, {file, "log/sasl-error.log"}},
         {errlog_type, error},
         {error_logger_mf_dir, "log/sasl"},      % Log directory
         {error_logger_mf_maxbytes, 10485760},   % 10 MB max file size
         {error_logger_mf_maxfiles, 5}           % 5 files max
        ]
 },

 %% Lager config
 %% see https://github.com/basho/lager#configuration
 %% see https://github.com/basho/lager/blob/master/src/lager.app.src
 {lager, [
   {handlers, [
     {lager_console_backend, info},
     {lager_file_backend, [{file, "error.log"}, {level, error},
                           {size, 10485760}, {date, "$D0"}, {count, 5}]},
     {lager_file_backend, [{file, "console.log"}, {level, info},
                           {size, 10485760}, {date, "$D0"}, {count, 5}]}
   ]}
 ]}
].
