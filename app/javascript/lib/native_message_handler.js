// USAGE: set data-app-environment-name="<%= app_environment_name %>" attribute to body element
// NativeMessageHandler.post('methodName', JSON.stringify({ key: "<%= value %>" })) for erb

function post(action, messageJson) {
    const appEnvironmentName = document.body.dataset.appEnvironmentName;

    try {
        if (appEnvironmentName === 'ios') {
            if (typeof webkit === 'undefined') {
                return console.warn("Webkit is undefined! Message:", messageJson);
            }
            webkit.messageHandlers[action].postMessage(messageJson);
        } else if (appEnvironmentName === 'android') {
            if (typeof AndroidBridge === 'undefined') {
                return console.warn("AndroidBridge is undefined! Message:", messageJson);
            }
            AndroidBridge[action](messageJson);
        } else {
            console.warn("environment name is undefined! appEnvironmentName: ", appEnvironmentName);
            console.warn("Message: ", messageJson);
        }
    }
    catch (e) {
        console.warn("action: ", action);
        console.warn("Message: ", messageJson);
        console.warn("Error: ", e);
    }
}

export const NativeMessageHandler = {
    post: (action, messageJson = '') => {
        post(action, messageJson);
    }
};

export default NativeMessageHandler;