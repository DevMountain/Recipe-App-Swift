//
//  RecipeDetailViewController.swift
//  Recipe-App-Swift
//
//  Created by Joshua Howland on 8/24/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

import UIKit

public class RecipeDetailViewController: UIViewController {

    public var recipeIndex: NSInteger = 0
    var margin :CGFloat = 15.0
    
    override public func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.whiteColor()
        self.title = RARecipes.titleAtIndex(self.recipeIndex)

        var scrollView = UIScrollView(frame: self.view.bounds)
        self.view.addSubview(scrollView)

        var topMargin :CGFloat = 20.0
        
        // We need to calculate the height of the description because it's going to cover more than one line.
        
        var heightForDescription = self.heightForText(RARecipes.descriptionAtIndex(self.recipeIndex), constrainedToWidth: self.view.bounds.size.width - 2 * margin)
        
        var description = UILabel(frame: CGRectMake(margin, topMargin, self.view.bounds.size.width - 2 * margin, heightForDescription))
        
        description.text = RARecipes.descriptionAtIndex(self.recipeIndex)
        
        // By setting numberOfLines = 0 it will let us have as many lines as we need.
        description.numberOfLines = 0;
        scrollView.addSubview(description)
        
        // We'll shift the top margin with every label we add to the scrollview
        var top :CGFloat = topMargin + heightForDescription + margin * 2.0;
        
        var ingredientsTitle = UILabel(frame: CGRectMake(margin, top, self.view.frame.size.width - 2 * margin, 20))
        
        ingredientsTitle.text = "Ingredients";
        ingredientsTitle.font = .boldSystemFontOfSize(17)
        scrollView.addSubview(ingredientsTitle)
        
        top += 20.0 + margin;
        
        for i in 0...(RARecipes.ingredientCountAtIndex(self.recipeIndex) - 1) {
        
            // I set the width of the volume to 1/4 of the screen (less margins). You can set it to whatever width you want. The best thing to do would be to find the maximum width of all ingredient volumes.

            var volume = UILabel(frame: CGRectMake(margin, top, (self.view.frame.size.width - 2 * margin) / 4, 20))
            volume.font = .boldSystemFontOfSize(17)
            volume.text = RARecipes.ingredientVolumeAtIndex(i, inRecipeAtIndex: self.recipeIndex)
            
            scrollView.addSubview(volume)
   
            // The width of the type is just the remaining space. It's possible that this get's truncated, because I'm not wrapping text here.

            var type = UILabel(frame: CGRectMake(margin + (self.view.frame.size.width - 2 * margin) / 4, top, (self.view.frame.size.width - 2 * margin) * 3 / 4, 20))
            
            type.numberOfLines = 0;
            type.font = .systemFontOfSize(15)
            type.text = RARecipes.ingredientTypeAtIndex(i, inRecipeAtIndex: self.recipeIndex)
            
            scrollView.addSubview(type)

            // Volume and type are on the same line, so we only update the top margin after they are added to the scrollview
            
            top += (20 + margin);
            
        }
        
        top += margin;
        
        var directionsTitle = UILabel(frame: CGRectMake(margin, top, self.view.frame.size.width - 2 * margin, 20))
        directionsTitle.text = "Directions";
        directionsTitle.font = .boldSystemFontOfSize(17)

        scrollView.addSubview(directionsTitle)
        
        top += 20 + margin;
        
        for i in 0...(RARecipes.directionsAtIndex(self.recipeIndex).count - 1) {
            
            var height = self.heightForText(RARecipes.directionsAtIndex(self.recipeIndex)[i] as String, constrainedToWidth: (self.view.frame.size.width - 2 * margin - 40))
            
            var count = UILabel(frame: CGRectMake(margin, top, 30, 20))
            count.font = .boldSystemFontOfSize(17)
            count.text = String(i + 1)
            scrollView.addSubview(count)

            var direction = UILabel(frame: CGRectMake(margin + 30, top, (self.view.frame.size.width - 2 * margin - 40), height))
            direction.numberOfLines = 0;
            direction.text = RARecipes.directionsAtIndex(self.recipeIndex)[i] as String

            scrollView.addSubview(direction)
            
            top += (height + margin);
        
        }
        
        // We set the content size of the scrollview after we've added all the labels so that we know how tall the size needs to be.
        scrollView.contentSize = CGSizeMake(self.view.frame.size.width, top + margin);
    
    }

    func heightForText(string: String, constrainedToWidth width: CGFloat) -> CGFloat {
        return (string as NSString).boundingRectWithSize(CGSize(width: width, height: CGFloat.max),
            options: NSStringDrawingOptions.UsesLineFragmentOrigin,
            attributes: [NSFontAttributeName: self.descriptionFont()],
            context: nil).size.height
    }

    func descriptionFont() -> UIFont {
        return .systemFontOfSize(17)
    }


}
