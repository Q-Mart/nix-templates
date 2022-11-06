package $sketch$

import processing.core._
import PConstants._
import PApplet._

import qlib._

import scala.util.Random

object Main extends PApplet {
  def main(args:Array[String]): Unit = {
    PApplet.main("$sketch$.Main", args)
  }
}

class Main extends PApplet {

  var random_seed = System.currentTimeMillis() / 1000

  override def setup(): Unit = {
    background(100)
  }

  override def settings(): Unit = {
    if (args != null) {
      // Process any arguments here
      args.length match {
        case 1 => random_seed = args(0).toLong
      }
    }

    size(1024, 768)
    Random.setSeed(random_seed)
    noiseSeed(random_seed)
  }

  override def draw {

    val output_img_path = random_seed.toString+".tiff"
    save(output_img_path)
    noLoop()
  }
}
