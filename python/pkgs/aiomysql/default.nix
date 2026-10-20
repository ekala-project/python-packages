{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  pymysql,
  setuptools,
  setuptools-scm,
  wheel,
}:

buildPythonPackage (finalAttrs: {
  pname = "aiomysql";
  version = "0.3.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "aio-libs";
    repo = "aiomysql";
    tag = "v${finalAttrs.version}";
    hash = "sha256-DBNLmroR1W/gsYtW0iGNpki6EYUq6MyHI2pCRdyapU4=";
  };

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail '"setuptools_scm[toml] >= 7, < 10"' '"setuptools_scm[toml] >= 7"'
  '';

  nativeBuildInputs = [
    setuptools
    setuptools-scm
    wheel
  ];

  dependencies = [ pymysql ];

  # Tests require MySQL database

  pythonImportsCheck = [ "aiomysql" ];

  meta = {
    description = "MySQL driver for asyncio";
    homepage = "https://github.com/aio-libs/aiomysql";
    license = lib.licenses.mit;
  };
})
