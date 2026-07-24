{
  lib,
  async-timeout,
  buildPythonPackage,
  curio,
  fetchFromGitHub,
  anyio,
  flask,
  pytest-asyncio,
  pytest-trio,
  setuptools,
  tiny-proxy,
  trio,
  trustme,
  yarl,
}:

buildPythonPackage (finalAttrs: {
  pname = "python-socks";
  version = "2.8.1";
  pyproject = true;
  src = fetchFromGitHub {
    owner = "romis2012";
    repo = "python-socks";
    tag = "v${finalAttrs.version}";
    hash = "sha256-Eu4xeBZbZvAGfFArMiUlUQQa4yywKWj+azv+OHiKJfU=";
  };

  build-system = [ setuptools ];

  dependencies = [
    trio
    curio
    async-timeout
  ];

  optional-dependencies = {
    trio = [ trio ];
    curio = [ curio ];
    anyio = [ anyio ];
  };
  pythonImportsCheck = [ "python_socks" ];

  meta = {
    description = "Core proxy client (SOCKS4, SOCKS5, HTTP) functionality for Python";
    homepage = "https://github.com/romis2012/python-socks";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
})
