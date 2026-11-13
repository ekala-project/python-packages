{
  lib,
  buildPythonPackage,
  fetchPypi,
  gfmetadata,
  protobuf,
  regex,
  setuptools,
  setuptools-scm,
}:

buildPythonPackage (finalAttrs: {
  pname = "gflanguages";
  version = "0.7.11";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-Fl0eLXwbAwi5+rJIqWbvgWQFxxpBt5wd0KY4vxW0/OM=";
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
    gfmetadata
    protobuf
    regex
  ];

  pythonImportsCheck = [ "gflanguages" ];

  meta = {
    description = "Python library for Google Fonts language metadata";
    homepage = "https://github.com/googlefonts/lang";
    license = lib.licenses.asl20;
  };
})
