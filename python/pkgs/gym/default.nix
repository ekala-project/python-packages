{ lib
, buildPythonPackage
, fetchFromGitHub
, # build-system
  setuptools
, # dependencies
  cloudpickle
, numpy
, gym-notices
,
}:

buildPythonPackage rec {
  pname = "gym";
  version = "0.26.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "openai";
    repo = "gym";
    tag = version;
    hash = "sha256-uJgm8l1SxIRC5PV6BIH/ht/1ucGT5UaUhkFMdusejgA=";
  };

  # Fix numpy2 compatibility
  postPatch = ''
    substituteInPlace gym/envs/classic_control/acrobot.py \
      --replace-fail "np.float_" "np.float64"

    substituteInPlace gym/utils/passive_env_checker.py \
      --replace-fail "np.bool8" "np.bool"

    substituteInPlace tests/envs/test_action_dim_check.py \
      --replace-fail "np.cast[dtype](OOB_VALUE)" "np.asarray(OOB_VALUE, dtype=dtype)" \
      --replace-fail "np.alltrue" "np.all"

    substituteInPlace tests/spaces/test_box.py \
      --replace-fail "np.bool8" "np.bool" \
      --replace-fail "np.complex_" "np.complex128"

    substituteInPlace tests/wrappers/test_record_episode_statistics.py \
      --replace-fail "np.alltrue" "np.all"
  '';

  build-system = [
    setuptools
  ];

  dependencies = [
    cloudpickle
    numpy
    gym-notices
  ];

  pythonImportsCheck = [ "gym" ];

  meta = {
    description = "Toolkit for developing and comparing your reinforcement learning agents";
    homepage = "https://www.gymlibrary.dev/";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
