require './common/init'
json = require './local_data/key_point_json/Lesson12.txt.json'
console.log json[12][1]['garden salad'][0].replace /\\n/, '\n'
#KeyPoint = _u.getModel 'key_point'
#datas = for value in [1 .. 3]
#  title: "#{value}"
#  text: "这是第#{value}个知识点"
#console.log datas
#KeyPoint.createQ datas
#.then (docs) ->
#  logger.info docs
#, (err) ->
#  logger.info err

#KeyPoint.create datas, (err) ->
#  docs = Array::slice.call arguments, 1
#  logger.info err, docs
