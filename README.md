# OpenFOAM-for-new-users
Репозиторий создан для помощи в освоении [OpenFOAM](https://github.com/StasF1/OpenFOAM-for-new-users/wiki/About) незнакомым с этой средой человеком.

Обучающие кейсы можно найти в [**OpenFOAM-for-new-users.Wiki**](https://github.com/StasF1/OpenFOAM-for-new-users/wiki) – вики данного репозитория.

---
# Structure
```
OpenFOAM-for-new-users-0.1-beta
├── doc
│   ├── images
│   │   ├── bladeMachines
│   │   ├── smoothingInParaView
│   │   └── snappyHexMesh
│   └── refences
├── installation
└── tutorials
    ├── bladeMachines
    │   ├── DensityBasedTurbo
    │   │   ├── AxialMixerMRFCHTSteadyState
    │   │   ├── AxialMixerMRFCHTUnsteady
    │   │   ├── AxialMixerMRFFSISteadyState
    │   │   ├── AxialRotorMRF
    │   │   ├── AxialRotorSRF
    │   │   ├── AxialStageMRFRotating
    │   │   ├── bumpMinf0675
    │   │   └── forwardStep
    │   └── extend-4.0
    │       ├── steadyCompressibleFoam
    │       │	├──2bump
    │       │	└── transonicBump
    │       ├── steadyCompressibleMRFFoam
    │       │	├── axialRotorStatorMRF
    │       │	├── axialTurbineMixingPlane
    │       │	├── bentRotorStator
    │       │	└── simpleRotorStator
    │       ├── steadyCompressibleSRFFoam
    │       │	├── bentBlade
    │       │	└── simpleBlade
    │       └── steadyUniversalMRFFoam
    │           ├── axialTurbineGgiJump
    │           └── axialTurbineMixingPlane
    ├── cloneExistingSolver
    │   ├── prism
    │   └── quadPiston
    └── snappyHexMesh
        ├── case
        ├── geometry
        └── mesh
```
## [doc](https://github.com/StasF1/OpenFOAM-for-new-users/tree/master/doc)
Файлы, ссылки (в т.ч. и на архив с используемой литературой) и т.д.

## [installation](https://github.com/StasF1/OpenFOAM-for-new-users/tree/master/installation)
Скрипты устанавливабщие OpenFOAM и его расширенные версии и дополнения. Полезные скрипты для только что установленной Ubuntu (особенно если при установке не была нажата кнопка `☑️ Minimal installation`).

## [tutorials](https://github.com/StasF1/OpenFOAM-for-new-users/tree/master/tutorials)
Обучающие проекты. Подробное описание которых можно найти в [Wiki](https://github.com/StasF1/OpenFOAM-for-new-users/wiki)