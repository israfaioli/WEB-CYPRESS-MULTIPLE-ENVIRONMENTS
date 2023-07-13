const path = require('path')
const os = require('oci-objectstorage')
const common = require('oci-common')
const fs = require('fs')
const {afterRunHook} = require("cypress-moachawesome-reporter/lib")

function replaceCertPath(configPath) {
    if(fs.existsSync(configPath))
    return

    const configWithoutCertPath = path.join(__dirname, "_config")
    const certPath = path.join(__dirname, "private_key.pem")
    const buffer = fs.readFileSync(configWithoutCertPath, {encoding: "utf-8"})
    const data = buffer.toString('ascii', 0, buffer.length).replace("CERT_PATH", certPath)
    fs.writeFileSync(configPath, data)
}

async function submitFileToOCI(client) {
    const filePath = path.join(__dirname, '../../', 'reports', 'index.html')
    const stats = fs.statSync(filePath)
    const nodeFsBlob = new os.NodeFSBlob(filePath, stats.size)
    const objectData = await nodeFsBlob.getData()

    console.log('Bucket is created. now adding object to the bucket')
    const putObjectRequest = {
        namespaceName: "",
        bucketName: "",
        putObecjtBody: objectData,
        objectName: "cypress-report",
        contentLenght: stats.size
    }

    const putObjectResponse = await client.putObject(putObjectRequest)
    console.log('Put Object executed successfully!' + putObjectResponse)
}

async function submitReport(result) {
    await afterRunHook(result)
    const configPath = path.join(__dirname, 'config')
    replaceCertPath(configPath)

    const client = new os.ObjectStorageClient({
        authenticationDetailsProvider: new common.ConfigFileAuthenticationDetailsProvider(
            configPath,
            "DEFAULT"
        )
    })

    await submitFileToOCI(client)
}

module.exports = {
    submitReport
}