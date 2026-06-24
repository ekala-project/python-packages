{
  lib,
  buildPythonPackage,
  cython,
  fetchFromGitHub,
  lz4,
  setuptools,
  zstandard,
}:

buildPythonPackage rec {
  pname = "fastavro";
  version = "1.12.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "fastavro";
    repo = "fastavro";
    tag = version;
    hash = "sha256-r/zaQ44ZPuSR1HxaqxD26kZPWREhmKP+oTOSa5QCEU4=";
  };

  preBuild = ''
    export FASTAVRO_USE_CYTHON=1
  '';

  build-system = [
    cython
    setuptools
  ];

  optional-dependencies = {
    codecs = [
      lz4
      zstandard
    ];
    zstandard = [ zstandard ];
    lz4 = [ lz4 ];
  };

  pythonImportsCheck = [ "fastavro" ];

  meta = {
    description = "Fast read/write of AVRO files";
    mainProgram = "fastavro";
    homepage = "https://github.com/fastavro/fastavro";
    license = lib.licenses.mit;
  };
}
