Addons for Granite Data Services

Small tips to tune AMF Serialization with Granite.

- granite_amf-deflate : use of deflate compression from Flex Client to Java Server (with Granite of course).

Deflate is easy to use with AMF from server to Flex client (for instance, TC server handles it quite easily).
But for AMF sent from Flex client to Server, there is no easy configuration.

These classes enables AMF deflate compression from Flex to Java with the use of Granite Data Services. It compresses the payload in actionScript using deflate, and it uses inflate on the server side with Granite Data Services.

For instance, here are some logs about the deserialization of deflated AMF on the Java side

DEBUG - AMF header found DEFLATE:TIME_SPENT=17ms

DEBUG - Deflated bytes length: 22775 Inflated bytes length: 131922 Java object: [MyJavaClass]

For 17ms spent in the Flex client to deflate the body request, there's a gain of 82,74% in size.

It is generally quite effective for requests with big sizes.
Of course results depend on your classes, check the deflate algorithm for more information : http://en.wikipedia.org/wiki/DEFLATE
