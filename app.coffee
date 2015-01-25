require './common/init'
express = require 'express'
morgan = require 'morgan'
path = require 'path'
bodyParser = require 'body-parser'

console.log config

app = express()

fs = require 'fs'
accessLog = fs.createWriteStream(config.morgan.accessLog, { flags: 'a' })
errorLog = fs.createWriteStream(config.morgan.errorLog, { flags: 'a' })

app.use(morgan('combined', {stream: accessLog}))
app.use(morgan('dev'))

app.use(bodyParser.json())
app.use(bodyParser.urlencoded({extended: false}))

app.use(express.static(path.join(__dirname, 'public')))

require('./routes')(app)

app.use((err, req, res, next) ->
  meta = '[' + new Date() + '] ' + req.url + '\n'
  if (err)
    errorLog.write(meta + err.stack + '\n')
    logger.error(err)
  next()
)

server = app.listen(config.port, () ->

  host = server.address().address
  port = server.address().port

  console.log('Example app listening at http://%s:%s', host, port)
)

app.get('/', (req, res) ->
  res.send('hello girlfriend!')
)

global.count = 0
app.get('/yang', (req, res) ->
  res.send("洋洋，这是你第#{++global.count}次来看我的网站")
)
