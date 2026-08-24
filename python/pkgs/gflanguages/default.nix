{ lib
, buildPythonPackage
, fetchPypi
, protobuf
, regex
, setuptools
, setuptools-scm
,
}:

buildPythonPackage rec {
  pname = "gflanguages";
  version = "0.7.7";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-JR+lmwGhPR/RoskpouNzGOE9kRgvSGgzx5Xa196k0eA=";
  };

  # Relax the dependency on protobuf 3. Other packages in the Google Fonts
  # ecosystem have begun upgrading from protobuf 3 to protobuf 4,
  # so we need to use protobuf 4 here as well to avoid a conflict
  # in the closure of fontbakery. It seems to be compatible enough.
  pythonRelaxDeps = [ "protobuf" ];

  env.PROTOCOL_BUFFERS_PYTHON_IMPLEMENTATION = "python";

  build-system = [
    setuptools
    setuptools-scm
  ];

  dependencies = [
    protobuf
    regex
  ];

  pythonImportsCheck = [ "gflanguages" ];

  meta = {
    description = "Python library for Google Fonts language metadata";
    homepage = "https://github.com/googlefonts/lang";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
}
