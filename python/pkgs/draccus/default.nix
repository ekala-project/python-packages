{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  setuptools,

  # dependencies
  mergedeep,
  pyyaml,
  toml,
  typing-inspect,

  # tests
  pytestCheckHook,
}:

buildPythonPackage rec {
  pname = "draccus";
  version = "0.11.6";
  pyproject = true;

  # No (recent) tags on GitHub
  src = fetchPypi {
    inherit pname version;
    hash = "sha256-0TT1dqH0/r2TxrIA33+S5f6//p79wKXzgb9QwuBWijk=";
  };

  # Pass non-callable type= (typing.Union, X | Y) through argparse.
  postPatch = ''
    substituteInPlace draccus/wrappers/field_wrapper.py \
      --replace-fail '_arg_options["type"] = tpe' \
                     '_arg_options["type"] = tpe if callable(tpe) else str'
  '';

  build-system = [
    setuptools
  ];

  dependencies = [
    mergedeep
    pyyaml
    toml
    typing-inspect
  ];

  pythonImportsCheck = [ "draccus" ];

  nativeCheckInputs = [
    pytestCheckHook
  ];

  meta = {
    description = "Framework for simple dataclass-based configurations based on Pyrallis";
    homepage = "https://github.com/dlwh/draccus";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
