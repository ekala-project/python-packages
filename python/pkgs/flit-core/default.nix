{
  lib,
  buildPythonPackage,
  flit,
}:

buildPythonPackage rec {
  pname = "flit-core";
  inherit (flit) version;
  pyproject = true;

  inherit (flit) src patches;

  postPatch = "cd flit_core";

  # Tests are run in the "flit" package.
  meta = {
    description = "Distribution-building parts of Flit. See flit package for more information";
    homepage = "https://github.com/pypa/flit";
    license = lib.licenses.bsd3;
    maintainers = [ ];
  };
}
