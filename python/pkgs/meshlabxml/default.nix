{
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
  lib,
}:

buildPythonPackage (finalAttrs: {
  pname = "meshlabxml";
  version = "2018.3";
  pyproject = true;

  src = fetchPypi {
    pname = "MeshLabXML";
    inherit (finalAttrs) version;
    sha256 = "1villmg46hqby5jjkkpxr5bxydr72y5b3cbfngwpyxxdljn091w8";
  };

  build-system = [ setuptools ];

  dependencies = [ ];

  pythonImportsCheck = [ "meshlabxml" ];

  meta = {
    homepage = "https://github.com/3DLIRIOUS/MeshLabXML";
    description = "Create and run MeshLab XML scripts with Python";
    license = lib.licenses.lgpl21;
  };
})
