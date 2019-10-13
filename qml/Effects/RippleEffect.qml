import QtQuick 2.12
import QtQuick.Particles 2.12

Item {
    id: root

    property alias running: particlesEmitter.enabled
    property alias size: particlesEmitter.endSize
    property alias source: particleImage.source
    property alias emitRate: particlesEmitter.emitRate

    onRunningChanged: {
        if (running) particleSystem.running = true;
    }

    ParticleSystem {
        id: particleSystem
        running: false
        onEmptyChanged: if (empty) running = false;

        Emitter {
            id: particlesEmitter
            enabled: false
            x: root.width / 2
            y: root.height / 2
            height: 1
            width: 1
            system: particleSystem
            size: 5
            lifeSpan: 3000
            maximumEmitted: 400
        }

        ImageParticle {
            id: particleImage
            system: particleSystem
            alpha: 0.4
            alphaVariation: 0.4
            colorVariation: 0.8
        }
    }
}
