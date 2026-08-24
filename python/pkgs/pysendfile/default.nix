{ lib
, buildPythonPackage
, fetchPypi
, setuptools
,
}:

buildPythonPackage rec {
  pname = "pysendfile";
  version = "2.0.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-UQpBSycJhvujx5y3bZCkyRDHAb+0P/mDpdTpKEYFDhc=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "sendfile" ];

  meta = {
    description = "Python interface to sendfile(2)";
    homepage = "https://github.com/giampaolo/pysendfile";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
