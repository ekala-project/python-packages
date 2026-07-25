{
  lib,
  buildPythonPackage,
  isPyPy,
  fetchPypi,
  hatchling,
  hatch-vcs,
}:

buildPythonPackage rec {
  pname = "execnet";
  version = "2.1.2";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-Y9g7/dmiPjW5xqMmFBIyT5ZMLsjc2NPGkW7pNz4L780=";
  };

  postPatch = ''
    # remove vbox tests
    rm testing/test_termination.py
    rm testing/test_channel.py
    rm testing/test_xspec.py
    rm testing/test_gateway.py
  ''
  + lib.optionalString isPyPy ''
    rm testing/test_multi.py
  '';

  build-system = [
    hatchling
    hatch-vcs
  ];

  # sometimes crashes with: OSError: [Errno 9] Bad file descriptor
  doCheck = !isPyPy;
  pythonImportsCheck = [ "execnet" ];
  meta = {
    description = "Distributed Python deployment and communication";
    homepage = "https://execnet.readthedocs.io/";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
