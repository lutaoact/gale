mongoose = require("mongoose")
Schema = mongoose.Schema
ObjectId = Schema.Types.ObjectId
BaseModel = (require '../../common/BaseModel').BaseModel

exports.ActiveTime = BaseModel.subclass
  classname: 'ActiveTime'
  populates: {
  }
  initialize: ($super) ->
    @schema = new Schema
      studentNo:
        type: Number
        required: true
      date:
        type: Date
        required: true
      pronunciation: Number
      vocabulary: Number
      class: Number
      input: Number

    @schema.index {studentNo: 1, date: 1}, {unique: true}

    $super()

