DONORS_VALUE = [
  { uid: "123asda", username: "virtuoid", cause: "wikipedia" },
  { uid: "345asda", username: "makevoid", cause: "riotvan" },
  { uid: "987asda", username: "filipporetti", cause: "mozilla" },
  { uid: "879asda", username: "wouldgo", cause: "riotvan" },
]

MINERS_VALUE = [
  { uid: "123asda", value: 123 },
  { uid: "345asda", value: 001 },
  { uid: "987asda", value: 001 },
  { uid: "879asda", value: 001 },
] # separated from donors_value because of Redis incr functionality: es: R["min

# todo: move in models / db, use a real db for users


require "#{PATH}/lib/pool"
require "#{PATH}/lib/cause"
require "#{PATH}/lib/donor"
require "#{PATH}/lib/value"


ACTIVE_MINED = [
  { uid: "123asda", time: Time.now-10 },
  { uid: "234asda", time: Time.now-1 }
]# periodically flush


# initialize db with saved causes


causes = eval File.read("db/causes.rb")
for cause in causes
  unless Cause.all.map{ |c| c[:name] }.include? cause[:name].to_s
    Cause.create cause
  end
end

Causes.instance.write