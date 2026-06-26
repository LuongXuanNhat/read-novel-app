allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

val newBuildDir: Directory =
    rootProject.layout.buildDirectory
        .dir("../../build")
        .get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}

// ⬇️ block fix PHẢI nằm ở đây, TRƯỚC evaluationDependsOn
subprojects {
    plugins.withId("com.android.library") {
        val androidExt = extensions.findByType(com.android.build.gradle.LibraryExtension::class.java)
        if (androidExt != null && androidExt.namespace == null) {
            val manifestFile = file("src/main/AndroidManifest.xml")
            if (manifestFile.exists()) {
                val manifestText = manifestFile.readText()
                val match = Regex("package=\"([^\"]+)\"").find(manifestText)
                if (match != null) {
                    androidExt.namespace = match.groupValues[1]
                }
            }
        }
    }
    afterEvaluate {
        val androidExt = extensions.findByName("android")
        if (androidExt is com.android.build.gradle.LibraryExtension) {
            val currentSdk = androidExt.compileSdk ?: 0
            if (currentSdk < 31) {
                androidExt.compileSdk = 31
            }
        }
    }
}

// block evaluationDependsOn đứng SAU cùng
subprojects {
    project.evaluationDependsOn(":app")
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}