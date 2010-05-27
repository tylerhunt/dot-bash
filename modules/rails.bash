# Provides helpers to start and stop the Rails development server.

load-rails() {
  if has-ruby-gem rails; then
    start-server() {
      ./script/server -d $@
    }

    stop-server() {
      if [ -s './tmp/pids/server.pid' ]; then
        local PID_FILE='./tmp/pids/server.pid'
      elif [ -s './tmp/pids/mongrel.pid' ]; then
        local PID_FILE='./tmp/pids/mongrel.pid'
      elif [ -s './tmp/pids/thin.pid' ]; then
        local PID_FILE='./tmp/pids/thin.pid'
      fi

      if [ $PID_FILE ]; then
        kill -s 9 `cat $PID_FILE`
        rm -f $PID_FILE
      fi
    }

    restart-server() {
      stop-server
      start-server $@
    }
  else
    return 1
  fi
}
