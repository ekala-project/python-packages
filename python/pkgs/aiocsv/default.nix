{
  lib,
  aiofiles,
  buildPythonPackage,
  cython,
  fetchFromGitHub,
  pytest-asyncio,
  setuptools,
  typing-extensions,
}:

buildPythonPackage (finalAttrs: {
  pname = "aiocsv";
  version = "1.4.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "MKuranowski";
    repo = "aiocsv";
    tag = "v${finalAttrs.version}";
    hash = "sha256-WENNtQKvpUuoYai6r8nTRamwCOloVA42YoAA3JGK9B8=";
  };

  build-system = [
    cython
    setuptools
  ];

  dependencies = [ typing-extensions ];
  preBuild = ''
    export CYTHONIZE=1
  '';

  pythonImportsCheck = [ "aiocsv" ];
  meta = {
    description = "Library for for asynchronous CSV reading/writing";
    homepage = "https://github.com/MKuranowski/aiocsv";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})
