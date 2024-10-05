extends Node

func sha256(text:String) -> String:
	var ctx_sha256 = HashingContext.new()
	ctx_sha256.start(HashingContext.HASH_SHA256)
	ctx_sha256.update(text.to_ascii_buffer())
	var hash_sha256 = ctx_sha256.finish().hex_encode()
	return hash_sha256
func sha1(text:String) -> String:
	var ctx_sha1 = HashingContext.new()
	ctx_sha1.start(HashingContext.HASH_SHA1)
	ctx_sha1.update(text.to_ascii_buffer())
	var hash_sha1 = ctx_sha1.finish().hex_encode()
	return hash_sha1
