app do |env|
  body = 'ok'
  [200, { 'Content-Type' => 'text/plain', 'Content-Length' => body.length.to_s }, [body]]
end

workers 6
threads 5, 5

bind 'ssl://127.0.0.1:9292?key=server.key&cert=server.crt'
state_path '/tmp/puma.state'
activate_control_app 'unix:///tmp/pumactl.sock'

prune_bundler