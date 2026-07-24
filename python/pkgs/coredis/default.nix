{
  lib,
  anyio,
  beartype,
  buildPythonPackage,
  hatchling,
  hatch-mypyc,
  hatch-vcs,
  types-deprecated,
  deprecated,
  exceptiongroup,
  fetchFromGitHub,
  packaging,
  pytest-asyncio,
  pytest-lazy-fixtures,
  pytest-mock,
  redis,
  typing-extensions,
}:

buildPythonPackage (finalAttrs: {
  pname = "coredis";
  version = "6.7.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "alisaifee";
    repo = "coredis";
    tag = finalAttrs.version;
    hash = "sha256-1Ks8rfOaz7rZruzp1k3V7UHCtckzomvA76+QRS7RlZo=";
  };

  postPatch = ''
    sed -i '/mypy==/d' pyproject.toml
    sed -i '/hatch-mypy/d' pyproject.toml
    sed -i '/opentelemetry-sdk/d' pyproject.toml
    substituteInPlace pyproject.toml \
      --replace-fail '"-K"' ""
  '';

  build-system = [
    hatchling
    hatch-mypyc
    hatch-vcs
    types-deprecated
  ];

  dependencies = [
    anyio
    beartype
    deprecated
    exceptiongroup
    packaging
    typing-extensions
  ];
  pythonImportsCheck = [ "coredis" ];
  meta = {
    description = "Async redis client with support for redis server, cluster & sentinel";
    homepage = "https://github.com/alisaifee/coredis";
    license = lib.licenses.mit;
  };
})
