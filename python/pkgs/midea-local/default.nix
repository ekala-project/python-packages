{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  aiofiles,
  aiohttp,
  colorlog,
  commonregex,
  defusedxml,
  deprecated,
  ifaddr,
  pycryptodome,
  platformdirs,
  typing-extensions,
}:

buildPythonPackage rec {
  pname = "midea-local";
  version = "11.0.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "midea-lan";
    repo = "midea-local";
    tag = "v${version}";
    hash = "sha256-9Yx3i/zZvVqZrlsbLxkWWFAITFnwOAaaiBoFfjaYbKw=";
  };

  build-system = [ setuptools ];

  dependencies = [
    aiofiles
    aiohttp
    colorlog
    commonregex
    defusedxml
    deprecated
    ifaddr
    pycryptodome
    platformdirs
    typing-extensions
  ];

  meta = {
    description = "Control your Midea M-Smart appliances via local area network";
    homepage = "https://github.com/midea-lan/midea-local";
    license = lib.licenses.mit;
  };
}
