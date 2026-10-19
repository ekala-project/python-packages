{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
  pymongo,
  six,
  blinker,
  pillow,
  coverage,
}:

buildPythonPackage (finalAttrs: {
  pname = "mongoengine";
  version = "0.29.3";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "MongoEngine";
    repo = "mongoengine";
    tag = "v${finalAttrs.version}";
    hash = "sha256-Y+cRQW29GBGt4aC+ENx8zSocV9A5Exzq1sMDv/wcJ3M=";
  };

  build-system = [ setuptools ];

  dependencies = [
    pymongo
    six
  ];
  postPatch = ''
    substituteInPlace setup.py \
      --replace "coverage==4.2" "coverage" \
      --replace "pymongo>=3.4,<=4.0" "pymongo"
  '';

  # tests require mongodb running in background

  pythonImportsCheck = [ "mongoengine" ];

  meta = {
    description = "MongoEngine is a Python Object-Document Mapper for working with MongoDB";
    homepage = "http://mongoengine.org/";
    license = lib.licenses.mit;
  };
})
