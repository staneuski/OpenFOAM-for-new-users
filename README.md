# Описание OpenFOAM-for-new-users
Репозиторий создан для помощи в освоении [OpenFOAM](https://github.com/StasF1/OpenFOAM-for-new-users/wiki/About) незнакомым с этой средой человеком.

Обучающие кейсы можно найти в [**OpenFOAM-for-new-users.Wiki**](https://github.com/StasF1/OpenFOAM-for-new-users/wiki) – вики данного репозитория.

# Требования
- [OpenFOAM v6](https://openfoam.org/download/) (для большинства проектов)
- [OpenFOAM-extend-3.0](https://github.com/StasF1/OpenFOAM-for-new-users/wiki/%5Binstall%5D-Extend#openfoam-extend-30) с установленными [DensityBasedTurbo](https://github.com/StasF1/OpenFOAM-for-new-users/wiki/%5Binstall%5D-Additions#densitybasedturbo) и [OpenFOAM-extend-4.0](https://github.com/StasF1/OpenFOAM-for-new-users/wiki/%5Binstall%5D-Extend#openfoam-extend-40) и (для проекта [_bladeMachines/_](https://github.com/StasF1/OpenFOAM-for-new-users/tree/master/tutorials/bladeMachines))

# [История версий](https://github.com/StasF1/dualFuelEngine/releases)
|                                                       Версия | Описание                                                     | Скачать архив                                                |
| -----------------------------------------------------------: | ------------------------------------------------------------ | ------------------------------------------------------------ |
| [v0.1-beta](https://github.com/StasF1/OpenFOAM-for-new-users/tree/v0.1-beta) | Созданы проекты *bladeMachines*/, *cloneExistingSolver/*, *snappyHexMesh*/ | [v0.1-beta.tar.gz](https://github.com/StasF1/OpenFOAM-for-new-users/archive/v0.1-beta.tar.gz), [v0.1-beta.zip](https://github.com/StasF1/OpenFOAM-for-new-users/archive/v0.1-beta.zip) |

# Структура
```gitignore
OpenFOAM-for-new-users-0.1-beta
├── doc
│   ├── images
│   │   ├── bladeMachines
│   │   ├── smoothingInParaView
│   │   └── snappyHexMesh
│   └── refences
├── installation # скрипты устанавливающие OpenFOAM, его расширенные версии и дополнения
└── tutorials
    ├── bladeMachines
    │   ├── DensityBasedTurbo                 # требует DensityBasedTurbo
    │   │   ├── AxialMixerMRFCHTSteadyState
    │   │   ├── AxialMixerMRFCHTUnsteady
    │   │   ├── AxialMixerMRFFSISteadyState
    │   │   ├── AxialRotorMRF
    │   │   ├── AxialRotorSRF
    │   │   ├── AxialStageMRFRotating
    │   │   ├── bumpMinf0675
    │   │   └── forwardStep
    │   └── extend-4.0                        # требует OpenFOAM-extend-4.0
    │       ├── steadyCompressibleFoam
    │       │	├── 2bump
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

## [doc/](https://github.com/StasF1/OpenFOAM-for-new-users/tree/master/doc)
Файлы, ссылки (в т.ч. и на архив с используемой литературой) и т.д.

## [installation/](https://github.com/StasF1/OpenFOAM-for-new-users/tree/master/installation)
Скрипты устанавливающие OpenFOAM, его расширенные версии и дополнения. Полезные скрипты для только что установленной Ubuntu (особенно если при установке не была нажата кнопка `☑️ Minimal installation`).

## [tutorials/](https://github.com/StasF1/OpenFOAM-for-new-users/tree/master/tutorials)
Обучающие проекты. Подробное описание которых можно найти в [Wiki](https://github.com/StasF1/OpenFOAM-for-new-users/wiki)
