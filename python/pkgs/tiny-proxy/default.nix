{
  lib,
  anyio,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "tiny-proxy";
  version = "0.3.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "romis2012";
    repo = "tiny-proxy";
    tag = "v${finalAttrs.version}";
    hash = "sha256-zE0SnO4IfX4KynCNQXWTJlHNe3TaZodg4eyriX2RRl8=";
  };

  nativeBuildInputs = [ setuptools ];

  dependencies = [ anyio ];

  # The tests depend on httpx-socks, whose tests depend on tiny-proxy.

  pythonImportsCheck = [ "tiny_proxy" ];

  meta = {
    description = "SOCKS5/SOCKS4/HTTP proxy server";
    homepage = "https://github.com/romis2012/tiny-proxy";
    license = lib.licenses.asl20;
  };
})
