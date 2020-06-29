module.exports = {
  networks: {
    development: {
      host: "127.0.0.1",
      port: "7545",
      network_id: "*"  //matches any network id
    }
  },
  compilers: {
    solc : {
      version: "0.6.1"
    }
  }
}