allprojects {
    repositories {
        google()
        mavenCentral()
    }
    afterEvaluate {
        if (project.name == "dual_screen") {
            try {
                the<com.android.build.gradle.BaseExtension>().apply {
                    if (namespace == null) {
                        namespace = "com.example.dual_screen"
                        println("WARNING: Manually setting namespace for project 'dual_screen' to '$namespace'")
                    }
                    compileOptions {
                        sourceCompatibility = JavaVersion.VERSION_1_8
                        targetCompatibility = JavaVersion.VERSION_1_8
                    }
                }
                project.extensions.findByType(org.jetbrains.kotlin.gradle.dsl.KotlinJvmOptions::class.java)?.apply {
                    jvmTarget = "1.8"
                }
                project.tasks.withType(org.jetbrains.kotlin.gradle.tasks.KotlinCompile::class.java).configureEach {
                    kotlinOptions {
                        jvmTarget = "1.8"
                    }
                }
            } catch (e: Exception) {
                // Ignore projects that don't have the android extension.
            }
        }
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
subprojects {
    project.evaluationDependsOn(":app")
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
