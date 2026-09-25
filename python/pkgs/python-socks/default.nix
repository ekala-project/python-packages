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
  version = "3.0.0";
  pyproject = true;
  src = fetchFromGitHub {
    owner = "romis2012";
    repo = "python-socks";
    tag = "v${finalAttrs.version}";
    hash = "sha256-Pp5059O2k4Bd/+s5ZrOUR6d/+t5T5xeMTqTQ2f4N3RM=";
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
  };
})
