function init(app) {
  app.ports.sendMessage.subscribe((message) => {
    console.log(message)
  })
}
