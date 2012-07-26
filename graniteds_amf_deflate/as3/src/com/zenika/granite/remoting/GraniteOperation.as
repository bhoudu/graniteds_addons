package com.zenika.granite.remoting {

	import flash.utils.ByteArray;
	import flash.utils.getTimer;

	import mx.core.mx_internal;
	import mx.messaging.messages.IMessage;
	import mx.messaging.messages.RemotingMessage;
	import mx.rpc.AbstractService;
	import mx.rpc.AsyncToken;
	import mx.rpc.remoting.Operation;
	import mx.rpc.remoting.RemoteObject;

	use namespace mx_internal;

	public class GraniteOperation extends Operation {

		public static const ZIP_HEADER:String = "DEFLATE";

		public static const DEFAULT_ZIP_HEADER_VALUE:String = "TIME_SPENT=";

		public function GraniteOperation(remoteObject:AbstractService = null, name:String = null) {
			super(remoteObject, name);
		}

		override mx_internal function invoke(message:IMessage, token:AsyncToken = null):AsyncToken {
			var remotingMessage:RemotingMessage = message as RemotingMessage;
			var byteArrayBody:ByteArray = new ByteArray();
			byteArrayBody.writeObject(remotingMessage.body);

			var start:int = getTimer();
			byteArrayBody.deflate();
			var end:int = getTimer();

			remotingMessage.headers[ZIP_HEADER] = DEFAULT_ZIP_HEADER_VALUE + (end - start).toString() + "ms";
			remotingMessage.body = byteArrayBody;

			return super.invoke(remotingMessage, token);
		}

	}
}
