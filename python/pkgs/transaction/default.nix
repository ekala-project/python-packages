{ lib
, fetchFromGitHub
, buildPythonPackage
, setuptools
, zope-interface
,
}:

buildPythonPackage rec {
  pname = "transaction";
  version = "5.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "zopefoundation";
    repo = "transaction";
    tag = version;
    hash = "sha256-8yvA2dvB69+EqsAa+hc93rgg6D64lcajl6JgFabhjwY=";
  };

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail "setuptools<74" "setuptools"
  '';

  build-system = [
    setuptools
  ];

  dependencies = [
    zope-interface
  ];

  pythonImportsCheck = [ "transaction" ];

  meta = {
    description = "Transaction management";
    homepage = "https://transaction.readthedocs.io/";
    license = lib.licenses.zpl21;
    maintainers = [ ];
  };
}
